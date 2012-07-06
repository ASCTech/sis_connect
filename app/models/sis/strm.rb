class SIS::Strm < SIS

  set_table_name "PS_OS_TERM_INFO_VW"

  default_scope { where(:acad_career => 'UGRD') }

  def self.current
    first.os_curr_strm
  end

end
