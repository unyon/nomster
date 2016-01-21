require 'test_helper'

class CommentsControllerTest < ActionController::TestCase
   test "create" do
    user = FactoryGirl.create(:user)
    sign_in user
    place = FactoryGirl.create(:place, :user => user)

    	#assert_difference 'Comment.count' do
        #post :create, :place_id => place.id, :comment=> {
        #  message: 'Great place!',
        #  rating: 'three_stars'
  		#}
 	    assert_difference 'Comment.count' do
        post :create, :place_id => place.id, :comment => {
        :message => 'yay', 
        :rating => '5_stars'
      }
    end

 		
 		assert_redirected_to place_path(place)
 
     	assert_equal 1, user.comments.count
	end

end
  