class CtrlController < ApplicationController
  def para
    render text: 'idパラメータ：' + params[:id]
  end

  def para_array
    render text: 'categoryパラメータ：' + params[:category].inspect
  end

  def req_head
    render text: request.headers['User-Agent']
  end

  def req_head2
    @headers = request.headers
  end

  require 'kconv'
  def upload_process
    file = params[:upfile]
    name = file.original_filename
    perms = ['.jpg', '.jpeg', 'gif', 'png']
    if !perms.include?(File.extname(name).downcase)
      result = 'upload出来るのは画像ファイルのみです'
    elsif file.size > 1.megabyte
      result = 'ファイルサイズは1MBまでです'
    else
      name = name.kconv(Kconv::SJIS, Kconv::UTF8)
      File.open("public/doc/#{name}", 'wb') { |f| f.write(file.read) }
      result = "#{name.toutf8}をアップロードしました"
    end
      render text: result
  end

  def updb
    @author = Author.find(params[:id])
  end

  def updb_process
    @author = Author.find(params[:id])
    if @author.update(params.require(:author).permit(:data))
      render text: '保存に成功しました'
    else
      render text: @author.errors.full.message[0]
    end
  end

  def show_photo
    id = params[:id] ? params[:id] : 1
    @author = Author.find(id)
    send_data @author.photo, type: @author.ctype, disposition: :inline
  end

  def get_xml
    @books = Book.all
    render xml: @books
  end

  def get_json
    @books = Book.all
    render json: @books
  end

  def download
    @books = Book.all
  end

  def cookie
    @email = cookies[:email]
  end

  def cookie_rec
    cookies[:email] = { value: params[:email],
    expires: 3.months.from_now, http_only: true }
    render text: 'クッキーを保存しました'
  end

  def session_show
    @email = session[:email]
  end

  def session_rec
    session[:email] = params[:email]
    render text: 'セッションを保存しました'
  end
end
