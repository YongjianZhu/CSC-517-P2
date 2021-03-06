class BooksController < ApplicationController
  before_action :set_book, only: [:show, :edit, :update, :destroy]

  # GET /books
  # GET /books.json
  def index
    @books = Book.search(params[:search_title], params[:search_author], params[:search_subject], params[:search_date])
  end

  # GET /books/1
  # GET /books/1.json
  def show
  end

  # GET /books/new
  def new
    @book = Book.new
  end

  # GET /books/1/edit
  def edit
  end

  # POST /books
  # POST /books.json
  def create
    if current_librarian
      @book = Book.new(librarian_book_params(book_params))
    else
      @book = Book.new(book_params)
    end
    respond_to do |format|
      if @book.save
        @library_book_list = LibraryBookList.new(book_id: @book.id, number: 0)
        @library_book_list.save
        format.html { redirect_to @book, notice: 'Book was successfully created.' }
        format.json { render :show, status: :created, location: @book }
      else
        format.html { render :new }
        format.json { render json: @book.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /books/1
  # PATCH/PUT /books/1.json
  def update
    respond_to do |format|
      if @book.update(book_params)
        format.html { redirect_to @book, notice: 'Book was successfully updated.' }
        format.json { render :show, status: :ok, location: @book }
      else
        format.html { render :edit }
        format.json { render json: @book.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /books/1
  # DELETE /books/1.json
  def destroy
    @book.destroy
    respond_to do |format|
      format.html { redirect_to books_url, notice: 'Book was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_book
    @book = Book.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def book_params
    params.require(:book).permit(:isbn, :title, :is_special_collection, :university_id, :library_id, :image,
                                 :author, :language, :published_date, :edition, :summery, :subject)
  end

  def librarian_book_params(book_params)
    new_params = book_params
    new_params[:university_id] = Library.find(current_librarian.library_id).university_id
    new_params[:library_id] = current_librarian.library_id
    new_params
  end
end
