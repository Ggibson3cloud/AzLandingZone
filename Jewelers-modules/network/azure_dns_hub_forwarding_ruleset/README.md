<!-- BEGIN_TF_DOCS -->
# azure_dns_hub_forwarding_ruleset

This module will deploy a DNS forwarding ruleset with rules and allow you to link the
ruleset to one or more virtual networks.

This module is designed to be used when deploying a spoke/DMZ/BU VNet. The ruleset will
get created in the DNS hub subscription and will get linked to the spoke VNet(s). This
module should only be needed in unique situations where a project/business unit has its
own internal DNS server and resolution for their custom internal domain is required.

> Note: this module hasn't been tested thorougly yet since the use case is so uncommon

## Provider Requirements

This module requires a single, default provider for the DNS hub subscription.

## Additional Info

* [Azure DNS Private Resolver endpoints and rulesets](https://learn.microsoft.com/en-us/azure/dns/private-resolver-endpoints-rulesets)
* [azurerm_private_dns_resolver_dns_forwarding_ruleset](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/private_dns_resolver_dns_forwarding_ruleset)
* [azurerm_private_dns_resolver_forwarding_rule](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/private_dns_resolver_forwarding_rule)
* [azurerm_private_dns_resolver_virtual_network_link](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/private_dns_resolver_virtual_network_link)

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_location"></a> [location](#input\_location) | The region where the forwarding ruleset will be created | `string` | n/a | yes |
| <a name="input_name"></a> [name](#input\_name) | The name of the forwarding ruleset | `string` | n/a | yes |
| <a name="input_private_dns_resolver_outbound_endpoint_id"></a> [private\_dns\_resolver\_outbound\_endpoint\_id](#input\_private\_dns\_resolver\_outbound\_endpoint\_id) | The list of IDs of the private DNS resolver's outbound endpoint | `string` | n/a | yes |
| <a name="input_required_tags"></a> [required\_tags](#input\_required\_tags) | Required Azure tags | <pre>object({<br>    App         = string<br>    Environment = string<br>    GBU         = string<br>    ITSM        = optional(string, "NETWORK")<br>    JobWbs      = string<br>    Owner       = string<br>  })</pre> | n/a | yes |
| <a name="input_resource_group_name"></a> [resource\_group\_name](#input\_resource\_group\_name) | The resource group where the forwarding ruleset will be created | `string` | `"rg-dns-prod-01"` | no |
| <a name="input_rules"></a> [rules](#input\_rules) | A collection of rules to be created in the forwarding ruleset. The key is the name of<br>the rule. It cannot be longer than 80 characters and can't include special characters.<br>Each target DNS server should be in the format "IP:port". The domain name must be a<br>valid FQDN with a trailing dot. | <pre>map(object({<br>    domain_name        = string<br>    enabled            = optional(bool, true)<br>    target_dns_servers = set(string)<br>  }))</pre> | n/a | yes |
| <a name="input_vnets"></a> [vnets](#input\_vnets) | A map of of remote VNets that will be linked to the forwarding ruleset. The key should<br>be the VNet key/name and the value should be its ID. | `map(string)` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_id"></a> [id](#output\_id) | The ID of the forwarding ruleset |

## Resources

| Name | Type |
|------|------|
| [azurerm_private_dns_resolver_dns_forwarding_ruleset.this](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/private_dns_resolver_dns_forwarding_ruleset) | resource |
| [azurerm_private_dns_resolver_forwarding_rule.this](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/private_dns_resolver_forwarding_rule) | resource |
| [azurerm_private_dns_resolver_virtual_network_link.this](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/private_dns_resolver_virtual_network_link) | resource |

## Examples

```hcl
# Example
dns_hub_forwarding_rulesets = {
  dnsfr-test = {
    location = "eastus2"
    rules = {
      "test-com" = {
        domain_name = "test.com."
        target_dns_servers = ["8.8.8.8:53", "8.8.4.4:53"]
      }
    }
    vnet_keys = ["vnet-dmz-alz-dev-01"]
  }
}
```
<!-- END_TF_DOCS -->