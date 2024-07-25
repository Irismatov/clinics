<%@ page import="java.sql.*" %>

<!DOCTYPE html>
<html>
<head>
    <title>User Balance</title>
</head>
<body>
<h1>User Balance</h1>

<c:if test="${not empty message}">
    <div class="error-message">${message}</div>
</c:if>
<!-- The balance is passed as a model attribute -->
<p>Current Balance: ${balance}</p>

<form action="/auth/add-balance" method="post">
    <label for="amount">Amount to Add:</label>
    <input type="number" id="amount" name="amount">
    <input type="submit" value="Add">
</form>

<!-- Back button that navigates to a specific URL -->
<button onclick="navigateBack()">Back</button>

<script>
    function navigateBack() {
        window.location.href = '${pageContext.request.contextPath}/auth/back-balance';
    }
</script>
</body>
</html>
