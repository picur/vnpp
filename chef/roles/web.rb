name        "web"
description "web role"

all_env = [
    "role[base]",
    "recipe[nginx]",
    "recipe[common::php55]",
    "recipe[php]",
    "recipe[php::module_apc]",
    "recipe[php::module_curl]",
    "recipe[php-fpm]",
    "recipe[common::app_config]"
]

run_list(all_env)

env_run_list(
    "_default"  => all_env,
    "prod"      => all_env,
    "dev"       => all_env + ["recipe[common::php_xdebug]"]
)

override_attributes(
    "nginx" => {
        "install_method" => "source",
        "source" => {
            "version" => "1.5.10",
            "checksum" => "1799c3111f71f08db0e1395f4c6f769c863c8e63f763a0b41b192126bc651c9e"
        },
        "server_tokens" => "off"
    },
    "php-fpm" => {
        "pools" => [
            {
                :name => "www",
                :listen => "127.0.0.1:9000",
                :user => "vagrant",
                :group => "vagrant"
            }
        ]
    }
)