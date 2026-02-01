variable "rgs" {
  type = map(object({
    rg_name       = string
    location   = string
    managed_by = optional(string)
  tags = map(string) }))

}