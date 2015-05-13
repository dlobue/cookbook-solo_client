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


default.sdb_domain = "chef"


#?
default.pubkey_folder = 'public_keys'



#TODO: turn this into an ohai plugin
default.ec2.region = ec2.placement_availability_zone[/^([a-zA-Z]*-[^-]+-[0-9]+)/,1] if attribute?("ec2")
