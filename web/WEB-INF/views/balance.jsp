<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
<head>
    <title>User Balance</title>
</head>
<body>
<h1>User Balance</h1>

<!-- Check if the message attribute is not empty -->
<c:if test="${not empty message}">
    <div class="error-message">${message}</div>
</c:if>

<!-- Display the balance passed as a model attribute -->
<p>Current Balance: ${balance}</p>

<form action="${pageContext.request.contextPath}/admin/add-balance" method="post">
    <label for="amount">Amount to Add:</label>
    <input type="number" id="amount" name="amount" required>
    <input type="submit" value="Add">
</form>

<!-- Back button that navigates to a specific URL -->
<button type="button" onclick="navigateBack()">Back</button>

<script>
    function navigateBack() {
        window.location.href = '${pageContext.request.contextPath}/admin/back-balance';
    }
</script>
</body>
</html>
