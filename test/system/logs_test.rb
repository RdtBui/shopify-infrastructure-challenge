require 'application_system_test_case'

class LogsTest < ApplicationSystemTestCase
  setup do
    @log = logs(:one)
  end

  test 'visiting the index' do
    visit logs_url
    assert_selector 'h1', text: 'Logs'
  end

  test 'creating a Log' do
    visit logs_url
    click_on 'New Log'

    fill_in 'Item brand', with: @log.item_brand
    fill_in 'Item category', with: @log.item_category
    fill_in 'Item price', with: @log.item_price
    fill_in 'Item quantity', with: @log.item_quantity
    fill_in 'Item sku', with: @log.item_sku
    fill_in 'Item title', with: @log.item_title
    click_on 'Create Log'

    assert_text 'Log was successfully created'
    click_on 'Back'
  end

  test 'updating a Log' do
    visit logs_url
    click_on 'Edit', match: :first

    fill_in 'Item brand', with: @log.item_brand
    fill_in 'Item category', with: @log.item_category
    fill_in 'Item price', with: @log.item_price
    fill_in 'Item quantity', with: @log.item_quantity
    fill_in 'Item sku', with: @log.item_sku
    fill_in 'Item title', with: @log.item_title
    click_on 'Update Log'

    assert_text 'Log was successfully updated'
    click_on 'Back'
  end

  test 'destroying a Log' do
    visit logs_url
    page.accept_confirm do
      click_on 'Destroy', match: :first
    end

    assert_text 'Log was successfully destroyed'
  end
end
