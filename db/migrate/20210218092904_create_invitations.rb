class CreateInvitations < ActiveRecord::Migration[6.1]
  def change
    create_table :invitations do |t|
      t.references :event, null: false, foreign_key: true
      t.references :host, null: false, foreign_key: true
      t.references :attendee, null: false, foreign_key: true

      t.timestamps
    end
  end
end
