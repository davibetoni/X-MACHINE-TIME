require 'net/http'

class Api::V1::InfosController < ApplicationController
  before_action :set_info, only: %i[show update destroy]

  def index
    @infos = Info.order('created_at DESC')
    render json: @infos.to_json(
      only: %i[id created_at status],
      include: {
        event: { only: %i[id event_name event_date contact_name] },
        filee: { only: %i[position compression type name length] },
        maachine: { only: [:maachine_id] }
      }
    )
  end

  def show
    render json: @info.to_json(
      only: %i[id created_at status],
      include: {
        event: { only: %i[id event_name event_date contact_name] },
        filee: { only: %i[position compression type name length] },
        maachine: { only: [:maachine_id] }
      }
    )

url = URI.parse('https://capsuladotempo.com/')
req = Net::HTTP::Get.new(url.to_s)
res = Net::HTTP.start(url.host, url.port) {|http|
  http.request(req)
}
  end

  def create
    @info = Info.create(info_params)

    @event = Event.create(event_name: @info.event_name, event_date: @info.event_date,
                          contact_name: @info.contact_name)

    @file = Filee.create(position: @info.video_sequence, compression: @info.file_compression,
                         type: @info.file_type, length: @info.video_length, name: @info.file_name)

    @machine = Maachine.create(maachine_id: @info.machine_id)

    @info.filee_id = @file.id
    @info.event_id = @event.id
    @info.maachine_id = @machine.id

    if @info.save
        render json: @info.to_json(
          only: [:id, :machine_id,:created_at, :video_sequence, :file_compression, :file_type, :file_name, :video_length, :status],
          :include => {
            :event => {only: [:id, :event_name, :event_date, :contact_name]}
          })
    end
  end

  def destroy
    @info.destroy
  end

  def update
    if @info.update(info_params)
      render json: @info
    else
      render json: @info.errors, status: :unprocessable_entity
    end
  end

  private

  def set_info
    @info = Info.find(params[:id])
  end

  def info_params
    params.require(:info).permit(:machine_id, :video_sequence, :file_compression, :file_type, :file_name,
                                 :video_length, :status, :event_name, :event_date, :contact_name)
  end
end
