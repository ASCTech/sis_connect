class SIS < ActiveRecord::Base

  establish_connection configurations['sis']

end
