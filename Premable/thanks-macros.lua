function set_macro_by_book_num(books_to_include, the_book_num, target_macro)
    for _, book in pairs(books_to_include) do
        if book == the_book_num then
            token.set_macro(target_macro, "1")
            return true
        end
    end
    token.set_macro(target_macro, "0")
    return false
end

FRONT_ART_CHANGED_BOOKS = {1, 4, 5, 6}
BACK_ART_CHANGED_BOOKS = {1}
QUOTE_CHANGED_BOOKS = {1, 2}
