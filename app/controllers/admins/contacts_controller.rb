class Admins::ContactsController < Admins::BaseController
  before_action :set_contact, only: [:show]

  # GET /contacts
  def index
    @contacts = Contact.all.order(id: :desc)

    filename = "contacts_#{Time.now.strftime('%Y%m%d%H%M%S')}.xlsx"
    respond_to do |format|
      format.html
      format.xlsx { headers["Content-Disposition"] = "attachment; filename=\"#{filename}\"" }
    end
  end

  # GET /contacts/1
  def show
  end

  # DELETE /contacts/1
  def destroy
    @contact.destroy
    redirect_to admins_contacts_path, notice: 'Contact was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_contact
      @contact = Contact.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def contact_params
      params.require(:contact).permit(:name, :email, :subject, :message)
    end
end
