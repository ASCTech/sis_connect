class SIS::PrimaryPlan < SIS

  set_table_name 'PS_OSR_PLAN_PRI'

  default_scope :select => 'emplid, acad_career as career, strm, acad_prog_primary as program, osr_primary_plan as plan'

  def self.current_plans_for(emplid)
    where(:emplid => emplid, :strm => SIS::Strm.current).map(&:plan)
  end

end
