require 'bundler/setup'
require "selenium-webdriver"
require "rmagick"

# gemをプロジェクト単位でインストールできるはず
# プロジェクト内に必要なgemをインストールしよう

class GetScreenShot
  def execute
    #Chrome用のドライバ
    driver = Selenium::WebDriver.for :chrome

    #studyplusにアクセスする
    driver.get "https://www.studyplus.jp/"

    sleep 3

    # ログイン
    login_button = driver.find_element(:class,'link-dummy')
    login_button.click
    input_for_email = driver.find_element(:name, 'name')
    input_for_password = driver.find_element(:name, 'password')
    input_for_email.send_keys(ENV['STUDYPLUS_EMAIL'])
    input_for_password.send_keys(ENV['STUDYPLUS_PASS'])
    submit_button =  driver.find_element(:class, 'c-login-modal-submit')
    submit_button.click

    sleep 3

    # マイページ→学習時間まで画面遷移
    driver.find_element(:partial_link_text,'マイページ').click
    sleep 3
    driver.find_element(:partial_link_text,'学習時間').click
    sleep 3

    # ブラフを週表示に変更
    driver.find_element(:xpath, "//button[contains(text(), '週')]").click
    sleep 5

    # スクショの高さを取得
    gakushujikan_element = driver.find_element(:xpath, "//h2[contains(text(), '学習時間')]/..")
    #↑読みこれないことがある。待ち時間とか工夫したほうがよさそう。要素が読み込まれるまで待機のように。

    gakushujikan_element.size.height
    gakushujikan_element.location.y

    max_height = gakushujikan_element.size.height + gakushujikan_element.location.y + 20

    visible_height = driver.execute_script("return document.documentElement.clientHeight").to_i
    visivle_width = driver.execute_script("return document.documentElement.clientWidth").to_i

    # 土台の画面を用意。この土台にスクロールしながらとるスクリーンショットを当てはめていく。
    base_image = Magick::Image.new(visivle_width,max_height){self.background_color = "red"}

    y = 0

    while y < max_height
      if y + visible_height > max_height then
        y = max_height - visible_height
      end

      # スクロール位置を移動
      driver.execute_script("window.scrollTo(" + "0," + y.to_s + ")")

      # なぜかここでsaveされる画像がwidthが倍のサイズ。
      driver.save_screenshot("tmp.png")
      tmp_image = Magick::ImageList.new("tmp.png").first
      # ここで等倍に戻す
      tmp_image = tmp_image.adaptive_resize(visivle_width, visible_height)
      one_image = Magick::Image.from_blob(tmp_image.to_blob).first

      # 土台画面にスクリーンショットを結合
      base_image.composite!(one_image, 0, y, Magick::OverCompositeOp)
      FileUtils.rm_r("tmp.png")

      y += visible_height
    end

    base_image.write("screenshot.png")
  end
end
