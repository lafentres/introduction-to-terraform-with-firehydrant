variable "firehydrant_api_key" {
  description = "API key for FireHydrant"
  type        = string
  sensitive   = true
}

variable "resource_prefix" {
  description = "A prefix string for all the resources you create so none of your resources overlap with anyone elses"
  type        = string
}