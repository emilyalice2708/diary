require 'pg'

def reset_test_database
  connection = PG.connect :dbname => 'diary_manager_test'
  connection.exec("TRUNCATE diary;")
end
