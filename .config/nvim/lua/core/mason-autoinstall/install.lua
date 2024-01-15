local Package = require("mason-core.package")
local Optional = require("mason-core.optional")
local registry = require("mason-registry")
local server_mapping = require("mason-lspconfig.mappings.server")

local notify = require("core.mason-autoinstall.notify")

---@param package_name string
local function get_package(package_name)
	return Optional.of_nilable(package_name):map(function(name)
		local ok, pkg = pcall(registry.get_package, name)

		if ok then
			return pkg
		end
	end)
end

local function install_package(package_name, version)
	get_package(package_name)
		:if_present(function(pkg)
			if not pkg:is_installed() then
				return pkg:install({ version = version }):once(
					"closed",
					vim.schedule_wrap(function()
						if pkg:is_installed() then
							notify(("%s was successfully installed"):format(package_name))
						else
							notify(
								("failed to install %s. Installation logs are available in :Mason and :MasonLog"):format(
									package_name
								),
								vim.log.levels.ERROR
							)
						end
					end)
				)
			end
		end)
		:if_not_present(function()
			notify(
				("%q is not a valid entry. Open :Mason for all available packages"):format(package_name),
				vim.log.levels.WARN
			)
		end)
end

---@param identifiers string[]
local function install(identifiers)
	for _, identifier in ipairs(identifiers) do
		local name, version = Package.Parse(identifier)

		-- allow mason-lspconfig mapping if available
		name = server_mapping.lspconfig_to_package[name] or name

		install_package(name, version)
	end
end

--- Installs Mason packages.
--- Some description is needed here
---@param identifiers string[] Table of package names, ex. { "luals", "stylua" }
return function(identifiers)
	if registry.refresh then
		registry.refresh(vim.schedule_wrap(function()
			install(identifiers)
		end))
	else
		install(identifiers)
	end
end
