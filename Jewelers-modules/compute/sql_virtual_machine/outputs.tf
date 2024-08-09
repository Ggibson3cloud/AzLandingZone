output "sql_server_id" {
  description = "The ID of the SQL Server"
  value       = azurerm_mssql_server.this.id
}

output "sql_database_ids" {
  description = "The IDs of the SQL Databases"
  value       = { for db in azurerm_mssql_database.databases : db.name => db.id }
}
