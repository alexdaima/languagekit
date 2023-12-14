defmodule Users.Guardian do
  use Guardian, otp_app: :users

  def subject_for_token(session_id, _claims) do
    {:ok, session_id}
  end
end
