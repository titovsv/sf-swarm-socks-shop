<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 0.13 |
| <a name="requirement_yandex"></a> [yandex](#requirement\_yandex) | 0.85 |

## Providers

No providers.

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_gateway"></a> [gateway](#module\_gateway) | ./modules/vpc/gateway | n/a |
| <a name="module_network"></a> [network](#module\_network) | ./modules/vpc/network | n/a |
| <a name="module_route"></a> [route](#module\_route) | ./modules/vpc/route | n/a |
| <a name="module_subnet_01"></a> [subnet\_01](#module\_subnet\_01) | ./modules/vpc/subnet | n/a |
| <a name="module_swarm_cluster"></a> [swarm\_cluster](#module\_swarm\_cluster) | ./modules/instance | n/a |

## Resources

No resources.

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_folder_id"></a> [folder\_id](#input\_folder\_id) | Folder id to create resources | `string` | `"b1gsm6pf678smcvm34fu"` | no |
| <a name="input_image_id"></a> [image\_id](#input\_image\_id) | Instance OS image. Default is Debian 11 | `string` | `"fd8oshj0osht8svg6rfs"` | no |
| <a name="input_zone"></a> [zone](#input\_zone) | Zone to create resources | `string` | `"ru-central1-a"` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_manager_ip"></a> [manager\_ip](#output\_manager\_ip) | n/a |
| <a name="output_worker_ip"></a> [worker\_ip](#output\_worker\_ip) | n/a |
<!-- END_TF_DOCS -->