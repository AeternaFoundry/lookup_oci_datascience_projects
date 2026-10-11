data "oci_datascience_projects" "datascience_projects_lookup" {
  for_each = var.datascience_projects_lookup

  compartment_id = each.value.compartment_id
  created_by     = each.value.created_by
  display_name   = each.value.display_name
  state          = each.value.state

  dynamic "filter" {
    for_each = each.value.filter != null ? each.value.filter : []
    content {
      name   = filter.value.name
      regex  = filter.value.regex
      values = filter.value.values
    }
  }
}

