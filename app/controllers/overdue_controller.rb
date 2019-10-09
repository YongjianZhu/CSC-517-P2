class OverdueController < ApplicationController
  def index
    @student_current_borrow_lists = StudentCurrentBorrowList.all
  end
end
