class MembersController < ApplicationController
  before_action :set_member, only: %i[ edit update]

  # GET /members or /members.json
  def index
    @members = Member.all
  end

  # GET /members/new
  def new
    @member = Member.new
  end

  # GET /members/1/edit
  def edit
  end

  # POST /members or /members.json
  def create
    @member = Member.new(member_params)

    respond_to do |format|
      if @member.save
        format.html { redirect_to members_url, notice: "Member was successfully created." }
        format.json { render :show, status: :created, location: @member }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @member.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /members/1 or /members/1.json
  def update
    respond_to do |format|
      if @member.update(member_params)
        format.html { redirect_to members_url, notice: "Member was successfully updated." }
        format.json { render :show, status: :ok, location: @member }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @member.errors, status: :unprocessable_entity }
      end
    end
  end

  def leader_board
    avg_score = {}
    member1 = GameDetail.group(:member1_id).select(:member1_id).count
    member2 = GameDetail.group(:member2_id).select(:member2_id).count
    members_count = member1.merge!(member2) { |k, o, n| o + n }
    members_count = members_count.select { |_member, counts| counts >= COUNT_TOP_MEMBERS }
    members_count.keys.each do |member|
      avg_score[member] = Member.find_by_id(member)&.avg_score
    end
    puts avg_score
    @final_avg_score = avg_score.sort_by {|_key, value| value}.reverse.to_h
    puts @final_avg_score

  end


  private
    # Use callbacks to share common setup or constraints between actions.
    def set_member
      @member = Member.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def member_params
      params.require(:member).permit(:first_name, :last_name, :mobile_number, :joining_date)
    end
end
