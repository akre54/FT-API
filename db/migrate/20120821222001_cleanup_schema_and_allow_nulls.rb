class CleanupSchemaAndAllowNulls < ActiveRecord::Migration
  def change
    change_table :customers do |t|
      t.remove :farm_id
      t.change_default :email, ''
      t.change_default :phone, ''
      t.change_default :fb_id, ''
      t.change_default :fb_token, ''
      t.change_default :twitter_id, ''
      t.change_default :twitter_token, ''
      t.change_default :fsq_id, ''
      t.change_default :fsq_token, ''
      t.change_default :img_url, ''
      t.timestamps
    end
    change_table :farms do |t|
      t.change_default :pin, ''
      t.change_default :farm_address, ''
      t.change_default :description, ''
      t.change_default :website, ''
      t.change_default :phone, ''
      t.remove :schedule, :lat, :long, :contact, :date_joined
      t.timestamps
    end
    change_table :transactions do |t|
      t.remove :time
      t.timestamps
    end
  end
end
