class SIS::Directory < SIS

  set_table_name 'PS_OS_DIRSERVICES'

  default_scope :select => 'os_namen, emplid'

end
