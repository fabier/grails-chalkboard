package chalkboard

class ChalkboardTagLib {
    static defaultEncodeAs = [taglib: 'html']
    //static encodeAsForTags = [tagName: [taglib:'html'], otherTagName: [taglib:'none']]

    private static final String ELLIPSIS = '…'

    def truncate = { attrs, body ->
        def maxLength = attrs.maxlength
        def bodyAsString = body();
        bodyAsString = bodyAsString.trim()
        if (maxLength == null || !maxLength.isInteger() || maxLength.toInteger() <= 0) {
            throw new Exception("The attribute 'maxlength' must an integer greater than 3. Provided value: $maxLength")
        } else {
            maxLength = maxLength.toInteger()
        }
        if (maxLength <= ELLIPSIS.size()) {
            throw new Exception("The attribute 'maxlength' must be greater than 3. Provided value: $maxLength")
        }
        if (bodyAsString.length() > maxLength) {
            out << raw(/<abbr title="${bodyAsString}">${
                bodyAsString[0..maxLength - (ELLIPSIS.size() + 1)]
            }$ELLIPSIS<\/abbr>/)
        } else {
            out << raw(bodyAsString)
        }
    }
}
