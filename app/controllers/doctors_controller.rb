# frozen_string_literal: true

class DoctorsController < ApplicationController
  include Doctorable

  before_action :doctor_params, only: %i[create update]
  before_action :set_doctors, only: :index
  before_action :set_doctor, only: %i[show update destroy]

  load_and_authorize_resource

  def index
    @doctors
  end

  def show
    @doctor
  end

  def create; end

  def update; end

  def destroy
    @doctor.destroy
  end

  def set_category
    change_category(@doctor, doctor_params[:category])
  end

  private

  def current_ability
    user = current_client || current_doctor
    @current_ability ||= Ability.new(user)
  end

  def set_doctors
    sort_column = params[:sort_column]

    @doctors = Doctor.all.sort_by { |doctor| doctor[sort_column] }
  end

  def set_doctor
    @doctor = Doctor.find(params[:id])
  end

  def doctor_params
    params.doctor.permit(:first_name, :second_name, :password, :work_experience, :category)
  end
end
