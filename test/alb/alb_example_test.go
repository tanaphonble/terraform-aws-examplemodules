package alb_test

import (
	"fmt"
	"testing"
	"time"

	http_helper "github.com/gruntwork-io/terratest/modules/http-helper"
	"github.com/gruntwork-io/terratest/modules/terraform"
)

func TestALBExamples(t *testing.T) {
	opts := &terraform.Options{
		TerraformDir: "../../examples/alb",
	}

	defer terraform.Destroy(t, opts)

	terraform.InitAndApply(t, opts)

	albDNSName := terraform.OutputRequired(t, opts, "alb_dns_name")
	url := fmt.Sprintf("http://%s", albDNSName)

	expectedStatus := 404
	expectedBody := "404: page not found"

	maxRetires := 10
	timeBetweenRetires := 10 * time.Second

	http_helper.HttpGetWithRetry(t, url, nil, expectedStatus, expectedBody, maxRetires, timeBetweenRetires)
}
