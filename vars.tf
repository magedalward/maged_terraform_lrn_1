
variable "p_name" {
  description = "project name"
  type        = string
}

variable "env" {
  description = "Deployment Environmnet .ex; test, prod, dev"
  type        = string
  validation {
    condition     = contains(["learn", "dev", "test", "prod"], var.env)
    error_message = "Environment name must be dev, test, prod, or learn"
  }
}


variable "rg_name" {
  description = "temporary resource group for deploying learning infra"
  type        = string
  validation {
    condition = startswith(
      replace(
        replace(var.rg_name, "{project}", var.p_name),
        "{env}",
        var.env
      ),
      "${var.p_name}-${var.env}-"
    )
    error_message = "this reource must start with the correct prefix"
  }
}


variable "location" {
  description = "region of the deployment"
  type        = string
}

variable "admin_Uname" {
  description = "user name for managing the infr"
  type        = string
  validation {
    condition = startswith(
      replace(replace(var.admin_Uname, "{project}", var.p_name), "{env}", var.env),
      "${var.p_name}-${var.env}-"
    )
    error_message = "this reource must start with the correct prefix"
  }
}

variable "admin_key" {
  description = "ssh public key path"
  type        = string
  default     = null
}


variable "devops_vnet" {
  description = " virtual network for the development "
  type        = string
  validation {
    condition = startswith(
      replace(
        replace(var.devops_vnet, "{project}", var.p_name),
        "{env}",
        var.env
      ),
      "${var.p_name}-${var.env}-"
    )
    error_message = "this reource must start with the correct prefix"
  }
}

variable "run_vnet" {
  description = " virtual network for the runing the full app "
  type        = string
  validation {
    condition = startswith(
      replace(
        replace(var.run_vnet, "{project}", var.p_name),
        "{env}",
        var.env
      ),
      "${var.p_name}-${var.env}-"
    )
    error_message = "this reource must start with the correct prefix"
  }
}




