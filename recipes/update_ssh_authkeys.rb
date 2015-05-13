#
#   Copyright 2013 Geodelic
#   Copyright 2013 Dominic LoBue
#
#   Licensed under the Apache License, Version 2.0 (the "License");
#   you may not use this file except in compliance with the License. 
#   You may obtain a copy of the License at
#
#       http://www.apache.org/licenses/LICENSE-2.0
#
#   Unless required by applicable law or agreed to in writing, software
#   distributed under the License is distributed on an "AS IS" BASIS,
#   WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied. 
#   See the License for the specific language governing permissions and
#   limitations under the License.
#
#

cookbook_file "authorized_keys generator" do
    only_if { node.current_user == 'root' }
    source "generate_authorized_keys.py"
    path "/usr/local/bin/generate_authorized_keys.py"
    mode '0755'
    owner 'root'
    group 'root'
    notifies :run, "execute[generate authorized_keys]", :immediately
end

#TODO: change attributes

execute "generate authorized_keys" do
    action :nothing
    command "/usr/local/bin/generate_authorized_keys.py -l #{node.env.s3_folder} #{node.env.s3_bucket} #{node.pubkey_folder} ubuntu"
    ignore_failure true
end

cron "generate authorized_keys" do
    minute 0
    user "root"
    command "/usr/local/bin/generate_authorized_keys.py -l #{node.env.s3_folder} #{node.env.s3_bucket} #{node.pubkey_folder} ubuntu"
end

