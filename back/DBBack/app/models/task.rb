class Task < ActiveRecord::Base
  has_many :pds_files, :class_name => 'ParsingDataSequenceFile', :foreign_key => 'task_id'
    
  has_many :r_task_raw_data
  has_many :raw_data_types, through: :r_task_raw_data
    
  has_many :r_user_submits
  has_many :users, through: :r_user_submits

  serialize :task_data_table_schema, Array

  def no_of_submitted_files
    self.pds_files.size
  end
  
  def no_of_passed_files
    # get from TDT (need to implement Task Data Table)
    0
  end

  def unaccepted_submitters
    unaccepted_submitters = []
    for submitter in self.users
      unaccepted_submitters << submitter unless submitter.is_accepted?(self)
    end

    unaccepted_submitters
  end

  def accepted_submitters
    accepted_submitters = []
    for submitter in self.users
      accepted_submitters << submitter if submitter.is_accepted?(self)
    end

    accepted_submitters
  end

  def raw_data_types!
    self.raw_data_types.as_json(only: [:id, :raw_name])
  end
  
  # 동적 테이블 생성 튜토리얼 스크립트들
  def self.create_tdt(tdt)
    ## tdt[:name] 이름을 가진 테이블 동적 생성
    unless ActiveRecord::Base.connection.table_exists?(tdt[:table_name])
      ActiveRecord::Base.connection.create_table tdt[:table_name] do |t|
        # :id is created automatically
        tdt[:cols].each do |col|
          logger.info 'column created??'
          t.column col, 'string'
        end
      end

    else
      logger.info 'TDT already created'
      logger.info ActiveRecord::Base.connection.tables
    end
  end

  # 동적 테이블 생성할때 기본 FORM
  def self.tdt_form
    tdt = Hash.new
    # :name 태그는 테스크 데이터 테이블 이름을 의미함.
    tdt[:table_name] = 'TEST'
    
    # :col 태그는 테스크 데이터 테이블의 컬럼의 리스트를 의미함.
    col_list = []
    col_list << 'test_column1' << 'test_column2' << 'test_column3'

    tdt[:cols] = col_list

    tdt
  end
end