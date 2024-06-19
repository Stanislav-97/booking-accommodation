class Realties::Filter
  attr_reader :realty_attrs, :facilities

  def initialize(realty_attrs, facilities)
    @realty_params = realty_attrs
    @facilities = Facility.all
  end

  def call
    ids = params[:facilities]&.map { |facility| facility[:id] }

    scope = Realty.all
    scope = scope.joins(:facilities).where(facilities: { id: ids }) if ids.present?

    scope = scope.where("area", { from: realty_attrs[:area], to: realty_attrs[:area] }) if realty_attrs[:area].present? #эксперимент
    scope = scope.where("floor > ?", realty_attrs[:floor]) if realty_attrs[:floor].present?
    scope = scope.where("building_year > ?", realty_attrs[:building_year]) if realty_attrs[:building_year].present?
    scope = scope.where("rooms_count = ?", realty_attrs[:rooms_count]) if realty_attrs[:rooms_count].present? #тут вроде правильно. прилетит конкретное значение
    scope = scope.where("realty_type = ?", realty_attrs[:realty_type]) if realty_attrs[:realty_type].present?

    scope
  end
end

