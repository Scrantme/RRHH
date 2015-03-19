class AddAttachmentCvToCandidates < ActiveRecord::Migration
  def self.up
    change_table :candidates do |t|
      t.attachment :cv
    end
  end

  def self.down
    remove_attachment :candidates, :cv
  end
end
