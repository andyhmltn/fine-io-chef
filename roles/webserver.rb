name "webserver"
description "Default webserver with NGINX/REDIS"
run_list "recipe[nginx::source]", "recipe[redis]", "recipe[fine-io]"