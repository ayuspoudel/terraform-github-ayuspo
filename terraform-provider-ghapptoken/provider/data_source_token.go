package provider

import (
	"os/exec"
	"strings"

	"github.com/hashicorp/terraform-plugin-sdk/v2/helper/schema"
)

func dataSourceToken() *schema.Resource {
	return &schema.Resource{
		Read: func(d *schema.ResourceData, m interface{}) error {
			group := d.Get("group").(string)

			out, err := exec.Command("rust-token-fetch", group).Output()
			if err != nil {
				return err
			}

			token := strings.TrimSpace(string(out))
			d.SetId(group)
			return d.Set("token", token)
		},
		Schema: map[string]*schema.Schema{
			"group": {
				Type:     schema.TypeString,
				Required: true,
			},
			"token": {
				Type:     schema.TypeString,
				Computed: true,
				Sensitive: true,
			},
		},
	}
}
