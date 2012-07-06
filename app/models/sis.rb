class SIS < ActiveRecord::Base

  db_settings = {
    :adapter  => 'oracle_enhanced',
    :database => 'dwhcrptdb.erp.ohio-state.edu:1772/DWHCRPT.erp.ohio-state.edu',
    :encoding => 'utf8'
  }
  establish_connection db_settings.merge(configurations['sis_credentials'])

end
