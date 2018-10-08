require_relative('../models/owner.rb')
require_relative('../models/beast.rb')
require_relative('../models/adoption')
require('pry')

Adoption.delete_all()
Owner.delete_all()
Beast.delete_all()


owner1 = Owner.new({'first_name' => 'Queenie', 'last_name' => 'Goldstein'})
owner2 = Owner.new({'first_name' => 'Porpentina', 'last_name' => 'Goldstein'})
owner3 = Owner.new({'first_name' => 'Albus', 'last_name' => 'Dumbledore'})

owner1.save
owner2.save
owner3.save

beast1 = Beast.new({'name' => 'Pickett', 'type' => 'bowtruckle', 'collection_date' => '1925-04-11', 'adoption_status' => 'not adoptable', 'characteristics' => 'peaceful and shy, but will attack if their tree is threatened', 'diet' => 'woodlice or insects' })
beast2 = Beast.new({'name' => 'Sickleworth', 'type' => 'niffler', 'collection_date' => '1926-07-24', 'adoption_status' => 'adoptable', 'characteristics' => 'affectionate but destructive NOT A HOUSE PET', 'diet' => 'unsure - possibly matellic objects?' })
beast3 = Beast.new({'name' => 'Fawkes', 'type' => 'pheonix', 'collection_date' => '1920-04-09', 'adoption_status' => 'adoptable', 'characteristics' => 'hard to domesticate, regenerates by bursting into flames and rising from the ashes, healing tears', 'diet' => 'herbs'})

beast1.save
beast2.save
beast3.save

adoption1 = Adoption.new({'adoption_date' => '1923-02-15', 'update_message' => 'Fawkes has settled into his new home easily, he is very loyal and we have created a strong bond', 'owner_id' => owner3.id, 'beast_id' => beast3.id})

adoption2 = Adoption.new({'adoption_date' => '1926-09-29', 'update_message' => "Sickleworth has been a great addition to my life. Of course, I do not keep him in my house, but I have made a suitable habitat for him out in my garden, filled with shiny objects to keep him happy", 'owner_id' => owner1.id, 'beast_id' => beast2.id})

adoption1.save
adoption2.save

binding.pry
nil
