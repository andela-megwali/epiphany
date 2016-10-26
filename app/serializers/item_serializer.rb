class ItemSerializer < ActiveModel::Serializer
  attributes :id, :name, :date_created, :date_modified, :complete

  belongs_to :bucketlist

  def date_created
    object.created_at
  end

  def date_modified
    object.updated_at
  end

  def created_by
    object.user.firstname
  end
end
