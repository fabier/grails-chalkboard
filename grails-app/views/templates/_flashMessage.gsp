<g:if test="${flash?.message}">
    <div class="alert alert-${flash?.level ?: "info"} alert-dismissible" role="alert">
        <button type="button" class="close" data-dismiss="alert">
            <span aria-hidden="true">
            &times;
            </span>
            <span class="sr-only">
                Close
            </span>
        </button>
        <g:if test="${flash?.level}">
            <strong>
                <g:message code="chalkboard.flash.${flash?.level}"/>
            </strong>
            <br/>
        </g:if>
        ${flash?.message}
    </div>
</g:if>

<g:if test="${flash?.error}">
    <div class="alert alert-danger alert-dismissible" role="alert">
        <button type="button" class="close" data-dismiss="alert">
            <span aria-hidden="true">
            &times;
            </span>
            <span class="sr-only">
                Close
            </span>
        </button>
        <g:if test="${flash?.level}">
            <strong>
                <g:message code="chalkboard.flash.${flash?.level}"/>
            </strong>
            <br/>
        </g:if>
        ${flash?.error}
    </div>
</g:if>