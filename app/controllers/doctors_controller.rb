class DoctorsController < ApplicationController

    def show
        find_doctor
        @patients = @doctor.patients
    end

    def index
        @doctors = Doctor.all
    end

    def new
        @doctor = Doctor.new

    end

    def edit
        find_doctor
    end

    def create
        @doctor = Doctor.new(strong_params)
        if @doctor.save
            redirect_to @doctor
        else
            render new_doctor_path
        end

    end

    def update
        @doctor = doctor.find_by(id: params[:id])
        @doctor.update(strong_params)
        if @doctor.save
            redirect_to @doctor
        else
            render edit_doctor_path
        end
    
    end

    def destroy
        find_doctor
        @doctor.destroy
        redirect_to doctors_path
    end

    private

    def strong_params(*args)
        params.require(:doctor).permit(*args)
    end

    def find_doctor
        @doctor = Doctor.find_by(id: params[:id])
    end

end
