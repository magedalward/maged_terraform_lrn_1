variable "p_name" {
	description = "project name"
	type = string
}

variable "env" {
	description = "Deployment Environmnet .ex; test, prod, dev"
	type = string
	validation {
	condition = contains(["learn", "dev", "test", "prod"], vars.env)
	err_message = "Environment name must be dev, test, prod, or learn"	}
}


variable "rg_name" {
	description = "temporary resource group for deploying learning infra"
	type = string
	validation {
		condition = contains(regex("^${vars.p_name}-${vars.env}-", vars.rg_name))
error_message = "this reource must start with the correct prefix"
	}
}

variable "location" {
	description = "region of the deployment"
	type = string
}

variable "admin_Uname"  {
	description = "user name for managing the infr"
	type = string
	validation {
		condition = contains(regex("^${vars.p_name}-${vars.env}-", vars.admin_Uname))
		error_message = "this reource must start with the correct prefix"
   }
}

variable "admin_key" {
	description = "ssh public key path"
	type = string
}



