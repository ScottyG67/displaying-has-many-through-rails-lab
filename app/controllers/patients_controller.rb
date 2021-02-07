class PatientsController < ApplicationController
    
    def show
        find_patient
    end

    def index
        @patients = Patient.all
    end

    def new
        @patient = Patient.new

    end

    def edit
        find_patient
    end

    def create
        @patient = Patient.new(strong_params)
        if @patient.save
            redirect_to @patient
        else
            render new_patient_path
        end

    end

    def update
        @patient = Patient.find_by(id: params[:id])
        @patient.update(strong_params)
        if @patient.save
            redirect_to @patient
        else
            render edit_patient_path
        end
    
    end

    def destroy
        find_patient
        @patient.destroy
        redirect_to patients_path
    end

    private

    def strong_params(*args)
        params.require(:patient).permit(*args)
    end

    def find_patient
        @patient = Patient.find_by(id: params[:id])
    end

end
