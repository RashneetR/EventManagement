class Admin::PhotosController < AdminController
  add_breadcrumb "Home", :admin_path
  add_breadcrumb "Photos", :admin_photos_path

  def index
    @events = Event.includes(:photos)
  end

  def new
    add_breadcrumb "New"
    @events = Event.all
    if @events.any?
      @photo = Photo.new
    else
      flash[:error] = "Create Event first"
      redirect_to admin_events_path
    end
  end

  def create
    add_breadcrumb "New"
    @events = Event.all
    @photo = Photo.new(params[:photo])
    if @photo.save
      flash[:success] = "Photo added"
      redirect_to admin_photos_path
    else
      render :new
    end
  end

  def edit
    @events = Event.all
    @photo = Photo.find(params[:id])
    @event = Event.find(@photo.event_id)
    add_breadcrumb "#{@event.title.capitalize}", admin_event_photos_path(@event.title)
    add_breadcrumb "#{@photo.title.capitalize}"
  end

  def update
    @photo = Photo.find(params[:id])
    @event = Event.find(@photo.event_id)
    add_breadcrumb "#{@event.title.capitalize}"
    add_breadcrumb "#{@photo.title.capitalize}"

    if @photo.update_attributes(params[:photo])
      flash[:success] = "Photo updated!"
      redirect_to admin_event_photos_path(@event.title)
    else
      render 'edit'
    end
  end

  def destroy
    @photo = Photo.find(params[:id])
    if @photo.destroy
      flash[:success] = "photo was removed"
      redirect_to admin_photos_path
    else
      flash[:error] = "failed to remove photo"
      redirect_to admin_photos_path
    end
  end

  def event_photos
    @event = Event.find_by_title(params[:event])
    add_breadcrumb "#{@event.title.capitalize}"
    @photos = @event.photos
  end
end
