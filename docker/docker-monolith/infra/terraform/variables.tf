variable project {
  description = "Project ID"
}

variable zone {
  description = "Zone"
  default     = "europe-west1-b"
}

variable region {
  description = "Region"
  default     = "europe-west1"
}

variable instance_count {
  description = "Count of docker instances"
  default     = 2
}

variable disk_image {
  description = "Disk image"
  default     = "reddit-monolith-docker"
}

variable public_key_path {
  description = "Path to the public key used for ssh access"
}

variable private_key_path {
  description = "Private key path"
}

