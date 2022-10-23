local jdtls = require("jdtls")
local jdtls_setup = require('jdtls.setup')

local jar_dir = '/home/tuks/.local/opt/jdtls/plugins/org.eclipse.equinox.launcher_1.6.400.v20210924-0641.jar'
local configuration_dir = '/home/tuks/.local/opt/jdtls/config_linux'
local project_name = vim.fn.fnamemodify(vim.fn.getcwd(), ':p:h:t')
local workspace_dir = '/home/tuks/code/java/.data/' .. project_name
local debug_plugin_dir = '/home/tuks/srcpkgs/java-debug/com.microsoft.java.debug.plugin/target/com.microsoft.java.debug.plugin-0.39.0.jar'

local config = {
    cmd = {
        'java',
        '-Declipse.application=org.eclipse.jdt.ls.core.id1',
        '-Dosgi.bundles.defaultStartLevel=4',
        '-Declipse.product=org.eclipse.jdt.ls.core.product',
        '-Dlog.protocol=true',
        '-Dlog.level=ALL',
        '-Xms1g',
        '--add-modules=ALL-SYSTEM',
        '--add-opens', 'java.base/java.util=ALL-UNNAMED',
        '--add-opens', 'java.base/java.lang=ALL-UNNAMED',
        '-jar', jar_dir,
        '-configuration', configuration_dir,
        '-data', workspace_dir,
    },
    root_dir = jdtls_setup.find_root({ '.git', 'mvnw', 'gradlew' }),
    settings = { java = {}, },
    init_options = {
        bundles = {
            vim.fn.glob(debug_plugin_dir)
        },
    },
    on_attach = function(client, bufnr)
        jdtls.setup_dap({ hotcodereplace = 'auto' })
    end
}

jdtls.start_or_attach(config)
