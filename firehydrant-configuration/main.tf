terraform {
  required_providers {
    firehydrant = {
      source  = "firehydrant/firehydrant"
      version = "~> 0.2.0"
    }
  }
}

provider "firehydrant" {
  firehydrant_base_url = "https://api.firehydrant.io/v1/"
  api_key              = var.firehydrant_api_key
}


##### Resources #####
# Teams
resource "firehydrant_team" "team1" {
  name = "${var.resource_prefix}-team1"
}

resource "firehydrant_team" "team2" {
  name = "${var.resource_prefix}-team2"
}

resource "firehydrant_team" "team3" {
  name        = "${var.resource_prefix}-team3"
  description = "description3"
}

# Services
resource "firehydrant_service" "service1" {
  name = "${var.resource_prefix}-service1"
}

resource "firehydrant_service" "service2" {
  name        = "${var.resource_prefix}-service2"
  description = "description2"

  labels = {
    test = "label",
  }

  links {
    href_url = "https://example.com/internal-dashboard"
    name     = "Internal Dashboard"
  }

  owner_id     = firehydrant_team.team1.id
  service_tier = 1

  team_ids = [
    firehydrant_team.team2.id,
    firehydrant_team.team3.id
  ]
}

# Functionalities
resource "firehydrant_functionality" "functionality1" {
  name = "${var.resource_prefix}-functionality1"
}

resource "firehydrant_functionality" "functionality2" {
  name        = "${var.resource_prefix}-functionality2"
  description = "description2"

  service_ids = [
    firehydrant_service.service2.id
  ]
}

# Environments
resource "firehydrant_environment" "environment1" {
  name = "${var.resource_prefix}-environment1"
}

resource "firehydrant_environment" "environment2" {
  name        = "${var.resource_prefix}-environment2"
  description = "description2"
}

# Severities
resource "firehydrant_severity" "severity1" {
  slug = "${upper(var.resource_prefix)}SEVERITY1"
}

resource "firehydrant_severity" "severity2" {
  slug        = "${upper(var.resource_prefix)}SEVERITY2"
  description = "description2"
}


##### Data Sources #####
# Services
data "firehydrant_service" "data_source_service" {
  id = ""
}

data "firehydrant_services" "data_source_services" {
  query = "data_source"
}

# Functionalities
data "firehydrant_functionality" "data_source_functionality" {
  functionality_id = ""
}

# Environments
data "firehydrant_environment" "data_source_environment" {
  environment_id = ""
}