require 'test_helper'

class FishingsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @fishing = fishings(:one)
  end

  test 'should get index' do
    get fishings_url
    assert_response :success
  end

  test 'should get new' do
    get new_fishing_url
    assert_response :success
  end

  test 'should create fishing' do
    assert_difference('Fishing.count') do
      post fishings_url,
           params: { fishing: { author_id: @fishing.author_id, imagen: @fishing.imagen, text: @fishing.text,
                                title: @fishing.title } }
    end

    assert_redirected_to fishing_url(Fishing.last)
  end

  test 'should show fishing' do
    get fishing_url(@fishing)
    assert_response :success
  end

  test 'should get edit' do
    get edit_fishing_url(@fishing)
    assert_response :success
  end

  test 'should update fishing' do
    patch fishing_url(@fishing),
          params: { fishing: { author_id: @fishing.author_id, imagen: @fishing.imagen, text: @fishing.text,
                               title: @fishing.title } }
    assert_redirected_to fishing_url(@fishing)
  end

  test 'should destroy fishing' do
    assert_difference('Fishing.count', -1) do
      delete fishing_url(@fishing)
    end

    assert_redirected_to fishings_url
  end
end
