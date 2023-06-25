<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 0.13 |
| <a name="requirement_yandex"></a> [yandex](#requirement\_yandex) | ~> 0.85 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_null"></a> [null](#provider\_null) | n/a |
| <a name="provider_yandex"></a> [yandex](#provider\_yandex) | ~> 0.85 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [null_resource.docker-swarm-manager](https://registry.terraform.io/providers/hashicorp/null/latest/docs/resources/resource) | resource |
| [null_resource.docker-swarm-manager-join](https://registry.terraform.io/providers/hashicorp/null/latest/docs/resources/resource) | resource |
| [null_resource.docker-swarm-manager-start](https://registry.terraform.io/providers/hashicorp/null/latest/docs/resources/resource) | resource |
| [null_resource.docker-swarm-worker](https://registry.terraform.io/providers/hashicorp/null/latest/docs/resources/resource) | resource |
| [yandex_compute_instance.instance-manager](https://registry.terraform.io/providers/yandex-cloud/yandex/latest/docs/resources/compute_instance) | resource |
| [yandex_compute_instance.instance-worker](https://registry.terraform.io/providers/yandex-cloud/yandex/latest/docs/resources/compute_instance) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_cores"></a> [cores](#input\_cores) | Number of instance cores | `number` | `2` | no |
| <a name="input_disk"></a> [disk](#input\_disk) | Instance boot HDD size in GB | `number` | `15` | no |
| <a name="input_folder_id"></a> [folder\_id](#input\_folder\_id) | Folder id to create resources | `string` | n/a | yes |
| <a name="input_image_id"></a> [image\_id](#input\_image\_id) | OS family to get id image | `string` | n/a | yes |
| <a name="input_instance_preemptible"></a> [instance\_preemptible](#input\_instance\_preemptible) | Make instance preemptible | `bool` | `false` | no |
| <a name="input_ipv4"></a> [ipv4](#input\_ipv4) | Use ipv4 | `bool` | `true` | no |
| <a name="input_ipv6"></a> [ipv6](#input\_ipv6) | Use ipv6 | `bool` | `false` | no |
| <a name="input_managers"></a> [managers](#input\_managers) | Count of manager nodes | `number` | `1` | no |
| <a name="input_memory"></a> [memory](#input\_memory) | Instance RAM size in GB | `number` | `2` | no |
| <a name="input_nat"></a> [nat](#input\_nat) | Use nat | `bool` | `false` | no |
| <a name="input_ssh_credentials"></a> [ssh\_credentials](#input\_ssh\_credentials) | Credentials for connect to instances | <pre>object({<br>    user        = string<br>    private_key = string<br>    pub_key     = string<br>  })</pre> | <pre>{<br>  "private_key": "~/.ssh/id_rsa",<br>  "pub_key": "~/.ssh/id_rsa.pub",<br>  "user": "titov"<br>}</pre> | no |
| <a name="input_subnet_id"></a> [subnet\_id](#input\_subnet\_id) | ID subnet to plug instance | `string` | n/a | yes |
| <a name="input_user_data"></a> [user\_data](#input\_user\_data) | Path to YAML file with user data | `string` | `"./meta.yml"` | no |
| <a name="input_workers"></a> [workers](#input\_workers) | Count of worker nodes | `number` | `1` | no |
| <a name="input_zone"></a> [zone](#input\_zone) | Zone to create resources | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_manager_ip"></a> [manager\_ip](#output\_manager\_ip) | n/a |
| <a name="output_worker_ip"></a> [worker\_ip](#output\_worker\_ip) | n/a |
<!-- END_TF_DOCS -->