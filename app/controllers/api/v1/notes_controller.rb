class Api::V1::NotesController < Api::V1::ApplicationApiController
  before_action :validate_note, except: [:index]
  before_action :authenticate
  before_action :set_note, only: [:show, :edit, :update, :destroy]
  load_and_authorize_resource

  # GET /notes
  # GET /notes.json
  def index
    @notes = Note.all
  end

  # GET /notes/1
  # GET /notes/1.json
  def show
  end

  # GET /notes/new
  def new
    @note = Note.new
  end

  # GET /notes/1/edit
  def edit
  end

  # POST /notes
  # POST /notes.json
  def create
    @note = Note.new(note_params)
    @note.user = @current_user
    respond_to do |format|
      if @note.save
        format.html { redirect_to @note, notice: 'Note was successfully created.' }
        format.json { render :show, status: :created}
      else
        format.html { render :new }
        format.json { render json: @note.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /notes/1
  # PATCH/PUT /notes/1.json
  def update
    respond_to do |format|
      if @note.update(note_params)
        format.html { redirect_to @note, notice: 'Note was successfully updated.' }
        format.json { render :show, status: :ok}
      else
        format.html { render :edit }
        format.json { render json: @note.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /notes/1
  # DELETE /notes/1.json
  def destroy
    @note.destroy
    respond_to do |format|
      format.html { redirect_to notes_url, notice: 'Note was successfully destroyed.' }
      format.json { render json: {:message => t('messages.delete')} }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_note
      begin
        @note = Note.find(params[:id])
      rescue ActiveRecord::RecordNotFound
        render json: {:message => t('messages.dont_find')}
      end
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def note_params
      params.require(:note).permit(:user_id, :title, :body)
    end
    def validate_note
      if !params[:note].present? # Que exista la key y que no este vacío el objeto del key
        render json: {:message => t('messages.add_name')}
      end
    end
end
