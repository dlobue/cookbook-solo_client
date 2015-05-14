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

include_attribute "solo_client::default"

if attribute? "ec2"
    persist = persistent_mash_factory_function(fqdn, env)

    persist[:ec2_public_hostname] = ec2[:public_hostname] unless (persist[:ec2_public_hostname] == ec2[:public_hostname])
    persist[:ec2_instance_id] = ec2[:instance_id] unless (persist[:ec2_instance_id] == ec2[:instance_id])
    persist[:ec2_region] = ec2[:region] unless (persist[:ec2_region] == ec2[:region])
    persist[:ec2_placement_availability_zone] = ec2[:placement_availability_zone] unless (persist[:ec2_placement_availability_zone] == ec2[:placement_availability_zone])
else
    persist = Mash.new()
end

persist[:state] ||= 'pending'
persist[:env] = env unless (persist[:env] == env)
persist[:roles] = roles unless (persist[:roles] == roles)

persist[:started] ||= Time.now.to_f.to_s
persist[:fqdn] ||= fqdn

persist[:ec2_public_hostname] ||= "localhost"

