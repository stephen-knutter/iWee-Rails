require 'test_helper'

class UsersIndexTest < ActionDispatch::IntegrationTest
    
#    def setup
#      @user = users(:steve)
#    end
    
#     test "index including pagination" do
#       log_in_as(@user)
#       get users_path
#       assert_template 'users/index'
#       assert_select 'div.pagination'
#       User.paginate(page: 1).each do |user|
#         assert_select 'a[href=?]', user_path(user), text: user.name
#       end
#     end
#     

  def setup
    @admin = users(:steve)
    @non_admin = users(:archer)
  end

  test "Allow admin to delete users" do
      log_in_as(@admin)
      assert_difference 'User.count', -1 do
        delete user_path(@non_admin)
      end
  end
  
  test "index as non-admin" do
    log_in_as(@non_admin)
    get users_path
    assert_select 'a', text: 'delete', count: 0
  end
end











